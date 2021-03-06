/*
 * SRT - Secure, Reliable, Transport
 * Copyright (c) 2018 Haivision Systems Inc.
 * 
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 * 
 */


/*****************************************************************************
written by
   Haivision Systems Inc.

   2011-06-23 (jdube)
        HaiCrypt initial implementation.
   2014-03-11 (jdube)
        Adaptation for SRT.
*****************************************************************************/

#include <sys/types.h>
#include <stdlib.h>     /* NULL */
#include <string.h>     /* memcpy */
#ifdef WIN32
    #include <winsock2.h>
    #include <ws2tcpip.h>
    #include <stdint.h>
#else
    #include <arpa/inet.h>  /* htonl */
#endif
#include "hcrypt.h"

int HaiCrypt_Tx_GetBuf(HaiCrypt_Handle hhc, size_t data_len, unsigned char **in_pp)
{
	hcrypt_Session *crypto = (hcrypt_Session *)hhc;
	int pad_factor = (HCRYPT_CTX_MODE_AESECB == crypto->ctx->mode ? 128/8 : 1);

	ASSERT(NULL != crypto);
	ASSERT(NULL != crypto->cipher);

	if (NULL != crypto->cipher->getinbuf) {
		ASSERT(NULL != crypto->cipher_data);
		if (0 >= crypto->cipher->getinbuf(crypto->cipher_data, crypto->msg_info->pfx_len, 
			data_len, pad_factor, in_pp)) {
			*in_pp = NULL;
			return(-1);
		}
	} else {
#ifndef WIN32
		ASSERT(crypto->inbuf != NULL);
#endif
		size_t in_len = crypto->msg_info->pfx_len + hcryptMsg_PaddedLen(data_len, pad_factor);
		*in_pp = crypto->inbuf;
		if (in_len > crypto->inbuf_siz) {
			*in_pp = NULL;
			return(-1);
		}
	}
	return(crypto->msg_info->pfx_len);
}

int HaiCrypt_Tx_ManageKeys(HaiCrypt_Handle hhc, void *out_p[], size_t out_len_p[], int maxout) 
{
	hcrypt_Session *crypto = (hcrypt_Session *)hhc;
	hcrypt_Ctx *ctx;
	int nbout = 0;

	if ((NULL == crypto)
	||  (NULL == crypto->ctx)
	||  (NULL == out_p)
	||  (NULL == out_len_p)) {
		HCRYPT_LOG(LOG_ERR, "%s", "invalid params\n");
		return(-1);
	}

	/* Manage Key Material (refresh, announce, decommission) */
	hcryptCtx_Tx_ManageKM(crypto);

	if (NULL == (ctx = crypto->ctx)) {
		HCRYPT_LOG(LOG_ERR, "%s", "crypto context not defined\n");
		return(-1);
	}
	ASSERT(ctx->status == HCRYPT_CTX_S_ACTIVE);

	nbout = hcryptCtx_Tx_InjectKM(crypto, out_p, out_len_p, maxout);
	return(nbout);
}

int HaiCrypt_Tx_GetKeyFlags(HaiCrypt_Handle hhc)
{
	hcrypt_Session *crypto = (hcrypt_Session *)hhc;
	hcrypt_Ctx *ctx;

	if ((NULL == crypto)
	||  (NULL == (ctx = crypto->ctx))){
		HCRYPT_LOG(LOG_ERR, "%s", "invalid params\n");
		return(-1);
	}
	return(hcryptCtx_GetKeyFlags(ctx));
}

int HaiCrypt_Tx_Data(HaiCrypt_Handle hhc, 
	unsigned char *in_pfx, unsigned char *in_data, size_t in_len) 
{
	hcrypt_Session *crypto = (hcrypt_Session *)hhc;
	hcrypt_Ctx *ctx;
	int nbout = 0;

	if ((NULL == crypto)
	||  (NULL == (ctx = crypto->ctx))){
		HCRYPT_LOG(LOG_ERR, "%s", "invalid params\n");
		return(-1);
	}
	/* Get/Set packet index */
	ctx->msg_info->indexMsg(in_pfx, ctx->MSpfx_cache); 

	/* Encrypt */
	{
		hcrypt_DataDesc indata;
		indata.pfx      = in_pfx;
		indata.payload  = in_data;
		indata.len      = in_len;

		if (0 > (nbout = crypto->cipher->encrypt(crypto->cipher_data, ctx, &indata, 1, NULL, NULL, NULL))) {
			HCRYPT_LOG(LOG_ERR, "%s", "encrypt failed\n");
			return(nbout);
		}
	}
	ctx->pkt_cnt++;

	return(nbout);
}

int HaiCrypt_Tx_Process(HaiCrypt_Handle hhc, 
	unsigned char *in_msg, size_t in_len, 
	void *out_p[], size_t out_len_p[], int maxout)
{
	hcrypt_Session *crypto = (hcrypt_Session *)hhc;
	hcrypt_Ctx *ctx;
	int nb, nbout = 0;

	if ((NULL == crypto)
	||  (NULL == crypto->ctx)
	||  (NULL == out_p)
	||  (NULL == out_len_p)) {
		HCRYPT_LOG(LOG_ERR, "%s", "invalid params\n");
		return(-1);
	}

	/* Manage Key Material (refresh, announce, decommission) */
	hcryptCtx_Tx_ManageKM(crypto);

	if (NULL == (ctx = crypto->ctx)) {
		HCRYPT_LOG(LOG_ERR, "%s", "crypto context not defined\n");
		return(-1);
	}
	ASSERT(ctx->status == HCRYPT_CTX_S_ACTIVE);

	nbout += hcryptCtx_Tx_InjectKM(crypto, out_p, out_len_p, maxout);

	/* Get packet index */
	ctx->msg_info->indexMsg(in_msg, ctx->MSpfx_cache); 

	/* Encrypt */
	nb = maxout - nbout;
	{
		hcrypt_DataDesc indata;
		indata.pfx      = in_msg;
		indata.payload  = &in_msg[ctx->msg_info->pfx_len];
		indata.len      = in_len - ctx->msg_info->pfx_len;

		if (crypto->cipher->encrypt(crypto->cipher_data, ctx, &indata, 1, &out_p[nbout], &out_len_p[nbout], &nb)) {
			HCRYPT_LOG(LOG_ERR, "%s", "encrypt failed\n");
			return(nbout);
		}
	}
	nbout += nb;
	ctx->pkt_cnt++;

	return(nbout);
}

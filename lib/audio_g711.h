#ifndef AUDIO_G711_H
#define AUDIO_G711_H


 
#define		G711_A_LAW	(0)
#define		G711_MU_LAW	(1)

int encode_g711(char *a_psrc, char *a_pdst, int in_data_len, unsigned char type);
int decode_g711(char *a_psrc, char *a_pdst, int in_data_len, unsigned char type);

#endif

/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/alexm_000/Documents/GitHub/FPGA_DESIGN/DIGITAL_SYTH_JAMMER/DBOUNCER.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1585794704_2762913819_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    int t16;
    int t17;
    static char *nl0[] = {&&LAB8, &&LAB9};

LAB0:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3552);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 3632);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(32, ng0);
    t1 = (t0 + 3696);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1832U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB7:    goto LAB3;

LAB8:    xsi_set_current_line(36, ng0);
    t6 = (t0 + 1352U);
    t7 = *((char **)t6);
    t9 = *((unsigned char *)t7);
    t6 = (t0 + 2248U);
    t8 = *((char **)t6);
    t10 = *((unsigned char *)t8);
    t11 = (t9 == t10);
    if (t11 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 3632);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB11:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 3696);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB7;

LAB9:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t1 = (t0 + 2128U);
    t5 = *((char **)t1);
    t17 = *((int *)t5);
    t3 = (t16 == t17);
    if (t3 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t17 = (t16 + 1);
    t1 = (t0 + 3760);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t17;
    xsi_driver_first_trans_fast(t1);

LAB14:    goto LAB7;

LAB10:    xsi_set_current_line(37, ng0);
    t6 = (t0 + 3632);
    t12 = (t6 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)1;
    xsi_driver_first_trans_fast(t6);
    goto LAB11;

LAB13:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 3760);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    *((int *)t12) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2248U);
    t5 = *((char **)t1);
    t4 = *((unsigned char *)t5);
    t9 = (t3 == t4);
    if (t9 != 0)
        goto LAB16;

LAB18:
LAB17:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 3632);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB14;

LAB16:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 3696);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB17;

}


extern void work_a_1585794704_2762913819_init()
{
	static char *pe[] = {(void *)work_a_1585794704_2762913819_p_0};
	xsi_register_didat("work_a_1585794704_2762913819", "isim/sim1_isim_beh.exe.sim/work/a_1585794704_2762913819.didat");
	xsi_register_executes(pe);
}

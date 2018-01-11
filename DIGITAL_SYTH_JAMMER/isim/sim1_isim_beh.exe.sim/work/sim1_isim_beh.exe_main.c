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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_1242562249;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *UNISIM_P_0947159679;
char *STD_TEXTIO;
char *UNISIM_P_3222816464;
char *IEEE_P_1367372525;
char *IEEE_P_2717149903;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    unisim_p_0947159679_init();
    std_textio_init();
    ieee_p_2717149903_init();
    ieee_p_1367372525_init();
    unisim_p_3222816464_init();
    unisim_a_1490675510_1976025627_init();
    unisim_a_0780662263_2014779070_init();
    unisim_a_0850834979_2152628908_init();
    unisim_a_0714155612_2768510774_init();
    unisim_a_0018426790_2768510774_init();
    unisim_a_1297477671_0429821216_init();
    unisim_a_3087411798_2584565154_init();
    work_a_3799114331_3212880686_init();
    work_a_3747853928_0000452272_init();
    work_a_3874392749_0000452272_init();
    work_a_4053114606_0000452272_init();
    work_a_2515858215_0000452272_init();
    work_a_2190468964_0000452272_init();
    work_a_3137526689_0000452272_init();
    work_a_2893664226_0000452272_init();
    work_a_1941962803_0000452272_init();
    work_a_1689982064_0000452272_init();
    work_a_4019617304_0000452272_init();
    work_a_4176308827_0000452272_init();
    work_a_3244316318_0000452272_init();
    work_a_3592110813_0000452272_init();
    work_a_2994351892_0000452272_init();
    work_a_2768321367_0000452272_init();
    work_a_2626422674_0000452272_init();
    work_a_1208337864_3212880686_init();
    work_a_2674167825_3212880686_init();
    xilinxcorelib_a_0917482550_3212880686_init();
    xilinxcorelib_a_0041094305_3212880686_init();
    xilinxcorelib_a_1993262630_3212880686_init();
    work_a_1156261981_3330682609_init();
    work_a_1543390391_3212880686_init();
    work_a_0811826522_2372691052_init();


    xsi_register_tops("work_a_0811826522_2372691052");

    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    UNISIM_P_3222816464 = xsi_get_engine_memory("unisim_p_3222816464");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");

    return xsi_run_simulation(argc, argv);

}

library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
 
entity en_8b10b is
port(
	k			: in std_logic;								-- k=0	-> Category D, k=1	-> Category K
	rd			: in std_logic;								-- rd=0	-> RD is -1,	rd=1	-> RD is +1
	data_in	: in std_logic_vector(7 downto 0) ;		-- data_in is 8b Data
	k_out		: out std_logic;								-- informs about k
	rd_out	: out std_logic;								-- informs about rd
	data_out : out std_logic_vector(9 downto 0)		-- data_out is 10b Data
); 
end en_8b10b;

architecture bv of en_8b10b is

	signal ai,bi,ci,di,ei,fi,gi,hi			: std_logic;
	signal ao,bo,co,do,eo,fo,go,ho,io,jo	: std_logic;

begin

-- Name each cable
	hi <= data_in(0);
	gi <= data_in(1);
	fi <= data_in(2);
	ei <= data_in(3);
	di <= data_in(4);
	ci <= data_in(5);
	bi <= data_in(6);
	ai <= data_in(7);
	
-- Connect outputs
	ao <= ( not rd  and ei and ai  ) or (   not ei  and di and  not ci  and ai  ) or (  rd and  not di  and  not bi  and ai  ) or (   not rd  and di and  not ci  and  not bi   ) or (   not rd  and di and  not bi  and ai  ) or (  di and  not ci  and  not bi  and ai  ) or (   not rd  and  not di  and ci and ai  ) or (   not di  and  not ci  and bi and ai  ) or (  rd and  not ei  and di and ai  ) or (   not rd  and  not ei  and  not di  and ci and  not bi   ) or (   not rd  and  not ei  and  not di  and  not ci  and  not ai   ) or (  rd and ei and  not di  and  not ci  and  not bi   ) or (  rd and ei and di and ci and bi and  not ai   ) or (  k and rd and ei and di and ci and  not ai );
	bo <= ( not rd  and  not ei  and bi and ai  ) or (   not rd  and  not di  and bi and ai  ) or (   not rd  and  not ci  and bi and ai  ) or (   not ei  and  not ci  and bi and ai  ) or (   not rd  and ci and bi and  not ai   ) or (   not ei  and ci and bi and  not ai   ) or (   not di  and ci and bi and  not ai   ) or (   not rd  and di and  not ci  and  not ai   ) or (  di and  not ci  and bi and  not ai   ) or (   not rd  and ei and  not ci  and  not ai   ) or (  ei and  not di  and  not ci  and bi  ) or (   not rd  and  not ei  and  not di  and  not ci  and ai  ) or (   not rd  and  not ei  and  not di  and ci and  not ai   ) or (  rd and  not ei  and  not di  and  not ci  and  not ai   ) or (  rd and ei and di and ci and ai  ) or (  k and rd and ei and di and ci and  not bi );
	co <= ( not rd  and ei and ci  ) or (   not rd  and  not di  and ci and ai  ) or (   not ei  and ci and  not bi  and ai  ) or (   not rd  and ci and bi and  not ai   ) or (   not di  and ci and bi and  not ai   ) or (  ei and  not di  and ci and  not bi   ) or (  rd and  not ei  and di and ci  ) or (   not rd  and  not ei  and  not di  and  not bi  and ai  ) or (   not rd  and  not ei  and  not di  and bi and  not ai   ) or (   not rd  and  not ei  and di and  not bi  and  not ai   ) or (   not k  and di and ci and  not bi  and  not ai   ) or (   not rd  and ei and  not di  and  not bi  and  not ai   ) or (  rd and  not ei  and  not di  and  not bi  and  not ai   ) or (  rd and ei and di and  not ci  and  not bi  and  not ai   ) or (  rd and ei and di and  not ci  and bi and ai);
	do <= ( not rd  and  not ei  and di and ai  ) or (   not rd  and di and  not ci  and ai  ) or (  di and  not ci  and  not bi  and ai  ) or (   not rd  and di and bi and  not ai   ) or (   not ei  and di and bi and  not ai   ) or (  di and  not ci  and bi and  not ai   ) or (   not rd  and di and ci and  not bi   ) or (   not ei  and di and ci and  not bi   ) or (  rd and  not ei  and di and  not ci   ) or (   not rd  and  not ei  and  not di  and  not ci  and  not bi   ) or (   not rd  and  not ei  and  not di  and  not ci  and  not ai   ) or (   not rd  and  not ei  and  not di  and  not bi  and  not ai   ) or (   not k  and di and ci and  not bi  and  not ai   ) or (  rd and  not di  and ci and bi and ai  ) or (  rd and ei and  not ci  and  not bi  and  not ai   ) or (  rd and ei and ci and bi and ai);
	eo <= ( not rd  and ei  ) or (  ei and  not di  and  not ci  and ai  ) or (  ei and  not di  and  not bi  and ai  ) or (  ei and  not ci  and  not bi  and ai  ) or (  ei and  not di  and bi and  not ai   ) or (  ei and  not ci  and bi and  not ai   ) or (   not rd  and  not di  and  not ci  and  not bi  and  not ai   ) or (   not rd  and di and ci and bi and ai  ) or (   not k  and ei and ci and  not bi  and  not ai   ) or (  rd and  not di  and  not ci  and  not bi  and ai  ) or (  rd and  not di  and  not ci  and bi and  not ai   ) or (  rd and  not di  and ci and  not bi  and  not ai   ) or (  rd and  not ei  and  not di  and ci and bi and ai  ) or (  rd and  not ei  and di and  not ci  and  not bi  and  not ai );
	io <= ( not rd  and  not ei  and  not di  and  not ci   ) or (   not rd  and  not ei  and  not di  and  not bi   ) or (   not rd  and  not ci  and  not bi  and  not ai   ) or (  k and  not rd  and  not bi  and  not ai   ) or (   not ei  and  not di  and  not ci  and bi and ai  ) or (   not ei  and  not di  and ci and bi and  not ai   ) or (   not ei  and  not di  and ci and bi and  not ai   ) or (   not ei  and di and  not ci  and  not bi  and ai  ) or (   not ei  and di and  not ci  and bi and  not ai   ) or (   not ei  and di and ci and  not bi  and  not ai   ) or (   not rd  and di and ci and bi and ai  ) or (  ei and  not di  and  not ci  and  not bi  and ai  ) or (  ei and  not di  and  not ci  and bi and  not ai   ) or (  ei and  not di  and ci and  not bi  and  not ai   ) or (  rd and  not di  and ci and bi and ai  ) or (  rd and ei and di and  not ci  and bi and ai  ) or (  rd and ei and di and ci and  not bi  and ai  ) or (  rd and ei and di and ci and bi and  not ai );
	fo <= ( not k  and  not rd  and  not gi   ) or (   not k  and  not rd  and fi  ) or (  rd and  not gi  and fi  ) or (  k and  not rd  and  not fi   ) or (   not rd  and  not hi  and gi and fi  ) or (  k and rd and hi and fi);
	go <= (not k  and  not rd  and gi  ) or (  rd and  not hi  and  not fi   ) or (  rd and gi and  not fi   ) or (  k and  not rd  and fi  ) or (   not rd  and hi and  not gi  and  not fi );
	ho <= (rd and hi and  not gi   ) or (  rd and hi and  not fi   ) or (   not rd  and  not hi  and  not gi  and  not fi   ) or (   not k  and  not rd  and hi and fi  ) or (   not k  and  not rd  and hi and gi  ) or (   not rd  and hi and gi and fi  ) or (  rd and  not hi  and gi and fi  ) or (  k and  not rd  and  not hi  and  not gi   ) or (  k and  not rd  and  not hi  and  not fi );
	jo <= ( not rd  and  not gi  and  not fi   ) or (  rd and  not hi  and fi  ) or (  rd and  not hi  and gi  ) or (  k and  not rd  and hi  ) or (   not k  and  not rd  and  not hi  and  not gi   ) or (   not k  and  not rd  and  not hi  and  not fi   ) or (   not k  and rd and gi and fi);
	
-- Inform k rd
	k_out <= k;
	rd_out <= rd;

-- Connect outputs
	data_out(0) <= ao;
	data_out(1) <= bo;
	data_out(2) <= co;
	data_out(3) <= do;
	data_out(4) <= eo;
	data_out(5) <= io;
	data_out(6) <= fo;
	data_out(7) <= go;
	data_out(8) <= ho;
	data_out(9) <= jo;
	
end bv;
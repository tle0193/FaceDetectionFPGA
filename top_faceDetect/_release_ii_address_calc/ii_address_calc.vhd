library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ii_address_calc is
	port(
		x_pos_point: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		y_pos_point: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		width_scale_img: in std_logic_vector(8 downto 0); -- 9bit unsigned ... range(0 to 320)
		p_offset: in std_logic_vector(16 downto 0); -- 16bit unsigned ... range(0 to 76799)
		ii_address: out std_logic_vector(16 downto 0) -- 17bit unsigned ... range(0 to 76799)
	);
end ii_address_calc;

architecture behavior of ii_address_calc is

signal result_mult0: std_logic_vector(13 downto 0); -- 14 bit unsigned
signal x_pos_point_extend: std_logic_vector(13 downto 0); -- 14 bit unsigned
signal reuslt_add0: std_logic_vector(13 downto 0); -- 14bit unsigned
signal result_add0_extend: std_logic_vector(16 downto 0); -- 16bit unsigned

component lpm_mult_unsign5bit_unsign9bit_to_unsign14bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (13 DOWNTO 0)
	);
end component;

component lpm_add_unsign14bit_to_unsign14bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (13 DOWNTO 0)
	);
end component;

component lpm_add_unsign17bit_to_unsign17bit IS
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (16 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (16 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0)
	);
end component;

begin

mult0: lpm_mult_unsign5bit_unsign9bit_to_unsign14bit
	port map
	(
		dataa => y_pos_point,
		datab => width_scale_img,
		result => result_mult0
	);

x_pos_point_extend(13 downto 5) <= (others=>'0'); -- unsigned always positive
x_pos_point_extend(4 downto 0) <= x_pos_point;
	
add0: lpm_add_unsign14bit_to_unsign14bit
	port map
	(
		dataa => result_mult0,
		datab => x_pos_point_extend,
		result => reuslt_add0
	);
result_add0_extend(16 downto 14) <= (others=>'0'); -- unsigned always positive
result_add0_extend(13 downto 0) <= reuslt_add0;

add1: lpm_add_unsign17bit_to_unsign17bit
	port map
	(
		dataa => result_add0_extend,
		datab => p_offset,
		result => ii_address
	);
	
end behavior;

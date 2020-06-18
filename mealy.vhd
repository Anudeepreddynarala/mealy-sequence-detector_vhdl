library ieee;
use ieee.std_logic_1164.all;

entity mealy is port(
clk,x,rst: in std_logic;
y,z: out std_logic);
end mealy;

architecture behavioral of mealy is
type state is (s0,s1,s2,s3,s4);
signal present_state, next_state : state;
begin

synchronous_process : process(clk)
begin 
if(rising_edge(clk)) then
	if(rst='1') then
		present_state<=s0;
	else
		present-state<=next_state;
	end if;
end if;
end process;

next_state_and_ouput_decoder : process(present_state, x)
begin
y<=0;
z<=0;
case(present_state) is when s0=>
	if(x='1') then next_state <= s1; y<=0; z<=0;
	else next_state <= s0; y<=0; z<=0; end if; when s1=>

	if(x='1') then next_state <= s1; y<=0; z<=0;
	else next_state <= s2; y<=1; z<=0; end if; when s2=>

	if(x='1') then next_state <= s3; y<=0; z<=0;
	else next_state <= s0; y<=0; z<=0; end if; when s3=>

	if(x='1') then next_state <= s2; y<=0; z<=1;
	else next_state <= s2; y<=1; z<=0; end if; when others=>

	next_state<=s0; y<=0;z<=0;
end case;
end process;

end behavioral;
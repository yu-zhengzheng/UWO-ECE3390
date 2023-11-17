library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
USE ieee.numeric_std.ALL; 
 
entity mult is 
end mult; 
 
architecture Behavioral of mult is 
signal a: unsigned(7 downto 0) := x"0f";  
signal b: unsigned(7 downto 0) := x"02"; 
signal n: integer :=7; 
signal ans : unsigned(15 downto 0) := x"0000"; 
signal clk : std_logic := '1'; 
 
begin  
a<=x"32" after 200 ns; 
b<=x"31" after 400 ns; 
clk <= not clk after 10 ns; 
process(clk,a,b) begin 
 if (clk'event and clk='1') then 
    case n is 
    when 0=> if (a'event or b'event) then  
                n<=8; end if; 
    when others =>  
    n<=n-1; 
    end case; 
end if; end process; 
process(n)begin 
    if (n=8)then ans<=x"0000"; 
    else if (a(n)='1')then  
            ans<=ans+ans+b; 
        else ans<=ans+ans; 
        end if; 
    end if; 
end process; 
END; 
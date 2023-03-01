select *

from polisa, client, Tipus_polissa, Venedor

where client.Client_DNI = Polissa.Client_Client_DNI

and polissa.Tipus_polissa_id = Tipus_polissa.id

and Polissa.Venedor_Venedor_DNI = “venedor”;
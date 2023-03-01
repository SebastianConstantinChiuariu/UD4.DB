Select NumPolissa, Tipus_polissa.Nom , Client.Client_DNI, Client.Nom, Client.Cognoms
from polisa, Client, tipus_polissa
where Client.Client_DNI = Polissa.Client_Client_DNI
and client.tipus_polissa = tipus_polissa.id
and tipus_polissa.mm = "venedor";
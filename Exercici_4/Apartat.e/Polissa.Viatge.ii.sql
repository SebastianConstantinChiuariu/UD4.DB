Select Polissa.NumPolissa, tipus_polissa.nom , client.Client_DNI, client.Nom, client.Cognoms

from Polissa, client, Tipus_polissa

where client.Client_DNI = Polissa.Client_Client_DNI

and client.Tipus_polissa=tipus_polissa.id

and Polissa.id_tipus_polissa = tipus_polissa.id

and tipus_polissa.mm = “viatges”;
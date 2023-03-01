select count(Linea_de_Ticket) as “numero_linies”

from Linea_de_Ticket, Ticket, Empleat

where Empleat.DNI = Ticket.DNI_Empleat

and Ticket.Identificador = Linea_de_Ticket.Identificador-Ticket

and Empleat.Nom like “o%”

and ticket.data < “23/2/2023”;
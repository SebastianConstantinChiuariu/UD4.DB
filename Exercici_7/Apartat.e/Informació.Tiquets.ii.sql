select Ticket.NºFactura, Ticket.data, Ticket.hora, Empleat.Nom, dums(linia_ticket.presuport_iva)

from Ticket, Venedor, Linea_de_Ticket

where Ticket.DNI_Empleat = Empleat.DNI

and Ticket.id = Linea_de_Ticket.Identificador

and Producte.Codi_Producte = Linea_de_Ticket.Codi_Producte

and Producte.Codi_Producte = “___” # codi de barres que haguem posat
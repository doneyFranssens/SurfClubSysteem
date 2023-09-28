CREATE DATABASE [SWPret];
GO
USE SWPret
GO
CREATE TABLE [Klanten] (
	[KlantId] int NOT NULL IDENTITY,
	[VNaam] nvarchar(30) NOT NULL,
	[FNaam] nvarchar(40) NOT NULL,
	[Adres] nvarchar(80) NOT NULL,
	[GemeenteId] int NOT NULL,
	[GsmNummer] nvarchar(12) NOT NULL,
	[Actief] nvarchar(12) NOT NULL,
	[AantalVerhuringen] int,
	CONSTRAINT [PK_Klanten] PRIMARY KEY ([KlantId])
)
GO
CREATE TABLE [Gemeentes] (
	[GemeenteId] int NOT NULL IDENTITY,
	[Gemeente] nvarchar(20) NOT NULL,
	[Postcode] int NOT NULL,
	CONSTRAINT [PK_Gemeentes] PRIMARY KEY ([GemeenteId])
)
GO
CREATE TABLE [Artikels] (
	[ArtikelId] int NOT NULL IDENTITY,
	[ArtikelNaam] nvarchar(50) NOT NULL,
	[ArtikelDoel] nvarchar(50) NOT NULL,
	[PrijsId] int NOT NULL,
	[ArtikelStaat] nvarchar(12) NOT NULL,
	CONSTRAINT [PK_Artikels] PRIMARY KEY ([ArtikelId])
)
GO
CREATE TABLE [Prijzen] (
	[PrijsId] int NOT NULL IDENTITY,
	[Borg] int NOT NULL,
	[PrijsPerUur] int NOT NULL,
	[PrijsPerDag] int,
	CONSTRAINT [PK_Prijzen] PRIMARY KEY ([PrijsId])
)
GO
CREATE TABLE [ArtikelUitleningen] (
	[UitleenId] int NOT NULL IDENTITY,
	[ArtikelId] int NOT NULL,
	[KlantId] int NOT NULL,
	[DatumUur] datetime NOT NULL,
	[DuurInUur] int NOT NULL,
	[Totaal] int NOT NULL,
	[Status] nvarchar(15) NOT NULL,
	[DatumUurOntvangst] datetime,
	[TerugBetaaalSaldoBorg] int NOT NULL,
	[StaatUitleen] nvarchar(3) NOT NULL,
	[StaatOntvangst] nvarchar(3),
	[Reglementair] nvarchar(8),
	CONSTRAINT [PK_ArtikelUitleningen] PRIMARY KEY ([UitleenId])
)
GO
CREATE TABLE [ArtikelHerstellingen] (
	[HerstelId] int NOT NULL IDENTITY,
	[ArtikelId] int NOT NULL,
	[Schade] nvarchar(60) NOT NULL,
	[HerstelStatus] nvarchar(20) NOT NULL,
	CONSTRAINT [PK_ArtikelHerstellingen] PRIMARY KEY ([HerstelId])
)
GO
ALTER TABLE [Klanten] WITH NOCHECK ADD CONSTRAINT [Klanten$GemeentesKlanten] FOREIGN KEY ([GemeenteId])
GO 
ALTER TABLE [Artikels] WITH NOCHECK ADD CONSTRAINT [Artikels$PrijzenArtikels] FOREIGN KEY ([PrijsId])
GO
ALTER TABLE [ArtikelUitleningen] WITH NOCHECK ADD CONSTRAINT [ArtikelUitleningen$ArtikelsArtikelUitleningen] FOREIGN KEY ([ArtikelId])
GO
ALTER TABLE [ArtikelUitleningen] WITH NOCHECK ADD CONSTRAINT [ArtikelUitleningen$KlantenArtikelUitleningen] FOREIGN KEY ([KlantId])
GO
ALTER TABLE [ArtikelHerstellingen] WITH NOCHECK ADD CONSTRAINT [ArtikelHerstellingen$ArtikelsArtikelHerstellingen] FOREIGN KEY ([ArtikelId])
GO
INSERT INTO Gemeentes(Gemeente, Postcode) VALUES
('Berendrecht', 2040)
GO
INSERT INTO Klanten(VNaam, FNaam, Adres, GemeenteId, GsmNummer, Actief, AantalVerhuringen) VALUES
('Doney', 'Franssens', 'Witherestraat 10', 0, '0491910778', 'Actief', 1)
GO
INSERT INTO Prijzen(Borg, PrijsPerUur, PrijsPerDag) VALUES
(20, 10, 70),
(30, 20, 80),
(40, 30, 90),
(50, 40, 100),
(100, 80, 200)
GO
INSERT INTO Artikels(ArtikelNaam, ArtikelDoel, PrijsId, ArtikelStaat) VALUES
('Surf plank Amateur', 'Surfen op kleine golven', 1, '100')
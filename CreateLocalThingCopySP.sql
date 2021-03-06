USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateLocalThingCopySP]    Script Date: 1/15/2020 10:06:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/15/2020
-- Description:	Create Local Thing Copy SP
-- =============================================
ALTER PROCEDURE [dbo].[CreateLocalThingCopySP](@THINGID AS INT, @USERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    INSERT INTO Things(Name, LocalImage, UOM, Width, Height)
	SELECT Name, LocalImage, UOM, Width, Height FROM Things WHERE LocalID = @THINGID
	INSERT INTO Transactions(UserID, ThingID, Date)
	VALUES (@USERID, @@IDENTITY, GETDATE())
	SELECT @@IDENTITY
END

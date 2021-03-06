USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[AddThingToPlanSP]    Script Date: 1/21/2020 10:23:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Add Thing to Plan SP
-- =============================================
ALTER PROCEDURE [dbo].[AddThingToPlanSP](@USERID AS INT, @THINGID AS INT, @PLANID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO Things(Name, LocalImage, UOM, Width, Height)
	SELECT Name, LocalImage, UOM, Width, Height FROM Things WHERE LocalID = @THINGID
	INSERT INTO Transactions(UserID, ThingID, PlanID, Date)
	VALUES (@USERID, @@IDENTITY, @PLANID, GETDATE())
	SELECT @@IDENTITY
END

USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateLocalPlanFloorSP]    Script Date: 1/21/2020 10:16:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/14/2020
-- Description:	Update Local Plan Floor SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateLocalPlanFloorSP](@USERID AS INT, @PLANID AS INT, @FLOORID AS INT, @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO Things(Name, LocalImage, UOM, Width, Height)
	SELECT Name, LocalImage, UOM, Width, Height FROM Things WHERE LocalID = @FLOORID
	SET @FLOORID = @@IDENTITY
    UPDATE Plans
	SET LocalFloorID = @FLOORID WHERE LocalID = @PLANID
	IF @TRANSID IS NULL
	BEGIN
		INSERT INTO Transactions(UserID, PlanID, ThingID, Date)
		VALUES (@USERID, @PLANID, @FLOORID, GETDATE())
		SET @TRANSID = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE Transactions SET UserID = @USERID, PlanID = @PLANID, ThingID = @FLOORID WHERE TransactionID = @TRANSID
	END
	SELECT @TRANSID
END

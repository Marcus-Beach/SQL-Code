USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateThingPublicIDSP]    Script Date: 1/21/2020 9:43:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Update Thing Public ID SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateThingPublicIDSP](@USERID AS INT, @THINGID AS INT, @PUBLICID AS INT, @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Things
	SET PublicID = @PUBLICID WHERE LocalID = @THINGID
	IF @TRANSID IS NULL
	BEGIN
		INSERT INTO Transactions(UserID, ThingID, Date)
		VALUES (@USERID, @THINGID, GETDATE())
		SET @TRANSID = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE Transactions SET UserID = @USERID, ThingID = @THINGID WHERE TransactionID = @TRANSID
	END
	SELECT @TRANSID
END

USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetLocalPlanSP]    Script Date: 1/21/2020 6:35:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Delete Plan SP
-- =============================================
CREATE PROCEDURE [dbo].[DeletePlanSP](@USERID AS INT, @PLANID AS INT, @TRANSID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM Things WHERE LocalID IN (SELECT ThingID FROM Transactions WHERE PlanID = @PLANID)
	DELETE FROM Plans WHERE LocalID = @PLANID
	IF @TRANSID IS NULL
	BEGIN
		INSERT INTO Transactions(UserID, PlanID, Date)
		VALUES (@USERID, @PLANID, GETDATE())
		SET @TRANSID = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE Transactions SET UserID = @USERID, PlanID = @PLANID WHERE TransactionID = @TRANSID
	END
	SELECT @TRANSID

END

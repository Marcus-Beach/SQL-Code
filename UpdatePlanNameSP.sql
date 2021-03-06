USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdatePlanNameSP]    Script Date: 1/20/2020 6:42:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/14/2020
-- Description:	Update Plan Name SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdatePlanNameSP](@USERID AS INT, @PLANID AS INT, @NAME AS NVARCHAR(50), @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Plans
	SET Name = @NAME WHERE LocalID = @PLANID
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

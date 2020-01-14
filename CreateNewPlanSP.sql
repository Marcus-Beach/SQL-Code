USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreatePlanSP]    Script Date: 1/13/2020 8:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Plan SP
-- =============================================
ALTER PROCEDURE [dbo].[CreatePlanSP](@OWNERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @PLANID AS INT
	SET @PLANID = ((SELECT top 1 LocalID from Plans order by LocalID desc) + 1)
	BEGIN TRANSACTION
    INSERT INTO Plans(LocalID, OwnerID)
	VALUES (@PLANID, @OWNERID)
	DECLARE @TRANSID AS INT
	SET @TRANSID = ((SELECT top 1 TransactionID from Transactions order by TransactionID desc) + 1)
	INSERT INTO Transactions(TransactionID, UserID, PlanID, Date)
	VALUES (@TRANSID, @OWNERID, @PLANID, GETDATE())
	COMMIT
	SELECT @TRANSID
END

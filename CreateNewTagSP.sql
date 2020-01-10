-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Thing SP
-- =============================================
CREATE PROCEDURE CreateTagSP(@NAME AS NVARCHAR(50), @USERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @TAGID AS INT
	SET @TAGID = ((SELECT top 1 LocalID from Tags order by LocalID desc) + 1)
	BEGIN TRANSACTION
    INSERT INTO Things(LocalID, Name)
	VALUES (@TAGID, @NAME)
	INSERT INTO Transactions(TransactionID, UserID, TagID, Date)
	VALUES (((SELECT top 1 TransactionID from Transactions order by TransactionID desc) + 1), @USERID, @TAGID, GETDATE())
	COMMIT
END
GO

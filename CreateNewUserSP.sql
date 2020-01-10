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
-- Description:	Create New User SP
-- =============================================
CREATE PROCEDURE CreateNewUserSP(@USERNAME AS VARCHAR(50), @EMAIL AS VARCHAR(50))
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Users(ID, Name, Status, Email)
	VALUES (((SELECT top 1 ID from Users order by ID desc) + 1), @USERNAME, 0, @EMAIL)
END
GO

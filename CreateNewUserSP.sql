USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateNewUserSP]    Script Date: 1/20/2020 6:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New User SP
-- =============================================
ALTER PROCEDURE [dbo].[CreateNewUserSP](@USERNAME AS NVARCHAR(50), @EMAIL AS NVARCHAR(50), @PASSWORD AS NVARCHAR(50))
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Users(Name, Status, Email, Password)
	VALUES (@USERNAME, 0, @EMAIL, @PASSWORD)
	INSERT INTO Transactions(UserID, Date)
	VALUES (@@IDENTITY, GETDATE())
	SELECT @@IDENTITY
END

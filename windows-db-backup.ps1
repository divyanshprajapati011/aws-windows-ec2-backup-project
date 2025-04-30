# ----------------------------------------
# Windows PowerShell Script for MySQL DB Backup to S3
# ----------------------------------------

# Step 1: Variables
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$backupFile = "C:\backup\db-backup-$date.sql"
$s3Bucket = "s3://divykart-db-backups"

# Step 2: Run mysqldump to export DB
mysqldump -u root -p"YourDBPassword" your_database_name > $backupFile

# Step 3: Upload to S3 using AWS CLI
aws s3 cp $backupFile $s3Bucket

# Step 4: Delete local backup file (optional)
Remove-Item $backupFile

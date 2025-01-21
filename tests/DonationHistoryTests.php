<?php
use PHPUnit\Framework\TestCase;

class DonationHistoryTest extends TestCase
{
    private $conn;

    protected function setUp(): void
    {
        // Setup a mock database connection or an in-memory SQLite database for testing
        $this->conn = new mysqli('localhost', 'root', '', 'bloodbank');
    }

    protected function tearDown(): void
    {
        // Close the database connection after each test
        $this->conn->close();
    }

    /**
     * Test inserting a donation record
     */
    public function testInsertDonationRecord()
    {
        $userID = 1;
        $donateDate = '2025-01-01';
        $donateTime = '10:00:00';
        $location = 'Test Location';
        $remark = 'Test Remark';

        $sql = "INSERT INTO donation (userID, donateDate, donateTime, location, remark) 
                VALUES ('$userID', '$donateDate', '$donateTime', '$location', '$remark')";

        $result = $this->conn->query($sql);

        $this->assertTrue($result, 'Failed to insert donation record.');

        // Verify the record exists in the database
        $query = "SELECT * FROM donation WHERE userID = $userID AND donateDate = '$donateDate'";
        $record = $this->conn->query($query);

        $this->assertNotFalse($record);
        $this->assertEquals(1, $record->num_rows);

        $data = $record->fetch_assoc();
        $this->assertEquals('Test Location', $data['location']);
        $this->assertEquals('Test Remark', $data['remark']);
    }

    /**
     * Test updating a donation record
     */
    public function testUpdateDonationRecord()
    {
        $donationID = 1;
        $donateDate = '2025-01-15';
        $donateTime = '14:00:00';
        $location = 'Updated Location';
        $remark = 'Updated Remark';

        $sql = "UPDATE donation SET donateDate = '$donateDate', donateTime = '$donateTime', location = '$location', remark = '$remark' 
                WHERE donationID = $donationID";

        $result = $this->conn->query($sql);

        $this->assertTrue($result, 'Failed to update donation record.');

        // Verify the record is updated in the database
        $query = "SELECT * FROM donation WHERE donationID = $donationID";
        $record = $this->conn->query($query);

        $this->assertNotFalse($record);
        $data = $record->fetch_assoc();

        $this->assertEquals('Updated Location', $data['location']);
        $this->assertEquals('Updated Remark', $data['remark']);
    }

    /**
     * Test deleting a donation record
     */
    public function testDeleteDonationRecord()
    {
        $donationID = 1;

        $sql = "DELETE FROM donation WHERE donationID = $donationID";
        $result = $this->conn->query($sql);

        $this->assertTrue($result, 'Failed to delete donation record.');

        // Verify the record no longer exists in the database
        $query = "SELECT * FROM donation WHERE donationID = $donationID";
        $record = $this->conn->query($query);

        $this->assertNotFalse($record);
        $this->assertEquals(0, $record->num_rows);
    }

    /**
     * Test error handling for invalid insert query
     */
    public function testInsertDonationRecordErrorHandling()
    {
        $sql = "INSERT INTO donation (invalidColumn) VALUES ('test')"; // Invalid query
        $result = @$this->conn->query($sql); // Suppress warnings

        $this->assertFalse($result, 'Expected query to fail due to invalid column.');
        $this->assertStringContainsString('Unknown column', $this->conn->error);
    }

    /**
     * Test error handling for invalid update query
     */
    public function testUpdateDonationRecordErrorHandling()
    {
        $sql = "UPDATE donation SET invalidColumn = 'test' WHERE donationID = 1"; // Invalid query
        $result = @$this->conn->query($sql); // Suppress warnings

        $this->assertFalse($result, 'Expected query to fail due to invalid column.');
        $this->assertStringContainsString('Unknown column', $this->conn->error);
    }
}

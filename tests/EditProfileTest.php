//Test for edit_profile_action.php

use PHPUnit\Framework\TestCase;

class EditProfileTest extends TestCase
{
    private $mysqli;

    protected function setUp(): void
    {
        // Setup a mock database connection
        $this->mysqli = new mysqli('localhost', 'root', '', 'test_bloodlink');
    }

    protected function tearDown(): void
    {
        // Close the mock database connection
        $this->mysqli->close();
    }

    public function testUpdateProfileWithoutFileUpload()
    {
        $userId = 1;

        // Mock POST data
        $_POST = [
            'firstname' => 'John',
            'lastname' => 'Doe',
            'gender' => 'male',
            'height' => '180',
            'weight' => '75',
            'bloodtype' => 'O+',
            'dob' => '1990-01-01',
            'phonenum' => '123456789',
            'address' => '123 Street, City',
            'allergies' => 'None',
            'medications' => 'None',
            'pastSurgeries' => 'None',
            'familyHistory' => 'None',
            'medicalConditions' => 'None'
        ];

        $_SESSION['UID'] = $userId;

        // Mock SQL queries
        $profileQuery = "UPDATE profile SET firstname='John', lastname='Doe', gender='male', 
            height='180', weight='75', bloodtype='O+', dob='1990-01-01', phonenum='123456789', 
            address='123 Street, City' WHERE userID=$userId";

        $medicalHistoryQuery = "UPDATE medical_history SET allergies='None', medications='None',
            past_surgeries='None', family_history='None', medical_conditions='None' WHERE userID=$userId";

        $this->mysqli->query($profileQuery);
        $this->mysqli->query($medicalHistoryQuery);

        // Verify updates
        $profileResult = $this->mysqli->query("SELECT * FROM profile WHERE userID=$userId");
        $medicalResult = $this->mysqli->query("SELECT * FROM medical_history WHERE userID=$userId");

        $this->assertNotFalse($profileResult);
        $this->assertNotFalse($medicalResult);

        $profileData = $profileResult->fetch_assoc();
        $medicalData = $medicalResult->fetch_assoc();

        $this->assertEquals('John', $profileData['firstname']);
        $this->assertEquals('None', $medicalData['allergies']);
    }

    public function testFileUploadValidation()
    {
        $file = [
            'name' => 'test_image.jpg',
            'type' => 'image/jpeg',
            'tmp_name' => '/tmp/php12345',
            'error' => UPLOAD_ERR_OK,
            'size' => 4000000
        ];

        $_FILES['fileToUpload'] = $file;

        // Simulate file validation logic
        $imageFileType = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
        $this->assertTrue(in_array($imageFileType, ['jpg', 'jpeg', 'png', 'gif']));
        $this->assertTrue($file['size'] <= 5000000);

        // Mock file move
        $targetDir = 'img/';
        $targetFile = $targetDir . basename($file['name']);
        $this->assertTrue(move_uploaded_file($file['tmp_name'], $targetFile));
    }

    public function testErrorHandlingForDatabaseFailure()
    {
        $this->mysqli->close(); // Simulate a closed connection

        $userId = 1;

        $query = "UPDATE profile SET firstname='John' WHERE userID=$userId";
        $result = @$this->mysqli->query($query);

        $this->assertFalse($result);
        $this->expectOutputString("WARNING :: Data not updated! There is something wrong");
    }
}

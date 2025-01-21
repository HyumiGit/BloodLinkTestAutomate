// Test for login_action.php

use PHPUnit\Framework\TestCase;

class LoginActionTest extends TestCase {
    public function testValidLogin() {
        $_POST['email'] = 'testuser@example.com';
        $_POST['pswd'] = 'validpassword';

        ob_start();
        include '../login_action.php';
        $output = ob_get_clean();

        $this->assertStringContainsString('WELCOME to BloodLink', $output);
    }

    public function testInvalidPassword() {
        $_POST['email'] = 'testuser@example.com';
        $_POST['pswd'] = 'wrongpassword';

        ob_start();
        include '../login_action.php';
        $output = ob_get_clean();

        $this->assertStringContainsString("Username and Password didn't match", $output);
    }

    public function testNonExistentEmail() {
        $_POST['email'] = 'nonexistent@example.com';
        $_POST['pswd'] = 'password';

        ob_start();
        include '../login_action.php';
        $output = ob_get_clean();

        $this->assertStringContainsString("Username doesn’t exist", $output);
    }
}

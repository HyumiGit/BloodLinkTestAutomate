// Test for signup_action.php

use PHPUnit\Framework\TestCase;

class SignupActionTest extends TestCase {
    public function testValidRegistration() {
        $_POST['email'] = 'newuser@example.com';
        $_POST['pswd'] = 'password';
        $_POST['confirmpswd'] = 'password';

        ob_start();
        include '../signup_action.php';
        $output = ob_get_clean();

        $this->assertStringContainsString('Congratulations! You have successfully registered', $output);
    }

    public function testExistingEmail() {
        $_POST['email'] = 'existinguser@example.com';
        $_POST['pswd'] = 'password';
        $_POST['confirmpswd'] = 'password';

        ob_start();
        include '../signup_action.php';
        $output = ob_get_clean();

        $this->assertStringContainsString('User exists', $output);
    }

    public function testPasswordMismatch() {
        $_POST['email'] = 'newuser@example.com';
        $_POST['pswd'] = 'password1';
        $_POST['confirmpswd'] = 'password2';

        ob_start();
        include '../signup_action.php';
        $output = ob_get_clean();

        $this->assertStringContainsString('Password and confirm password do not match', $output);
    }
}

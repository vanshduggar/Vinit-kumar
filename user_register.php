<?php include "includes/header.php"; ?>
<?php include "includes/navigation.php"; ?>
   
   <?php
    if(isset($_POST['create_user'])){
        $username = $_POST['username'];
        $user_firstname = $_POST['user_firstname'];
        $user_lastname = $_POST['user_lastname'];
        $user_email = $_POST['user_email'];
        $user_password = $_POST['user_password'];
        $user_role = $_POST['user_role'];
        $qry = "INSERT INTO users(username,user_firstname,user_lastname,user_email,user_password,user_role,user_image) VALUES('$username','$user_firstname','$user_lastname','$user_email','$user_password','$user_role','')";
        $result = mysqli_query($connection,$qry);
        if($result){
            echo "<script> alert('Registered Successfully!!!');
                window.location='index.php';
                </script>";
    }
}
?>
<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="title">Username :- </label>
        <input type="text" class="form-control" name="username" placeholder="Enter your username" required>
    </div>
    <div class="form-group">
        <label for="title">First Name :- </label>
        <input type="text" class="form-control" name="user_firstname" placeholder="Enter your firstname" required>
    </div>
    <div class="form-group">
        <label for="title">Last Name :- </label>
        <input type="text" class="form-control" name="user_lastname" placeholder="Enter your lastname" required>
    </div>
    <div class="form-group">
        <label for="title">Email :- </label>
        <input type="email" class="form-control" name="user_email" placeholder="Enter your email" required>
    </div>
    <div class="form-group">
        <label for="title">Password :- </label>
        <input type="password" class="form-control" name="user_password" placeholder="Enter your password" required>
    </div>
    <div class="button-group">
        <input type="submit" class="btn btn-primary" name="create_user" value="Register">
    </div>
</form>

<?php include "includes/footer.php"; ?>

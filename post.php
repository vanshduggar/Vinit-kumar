<?php include "includes/header.php"; ?>
<?php include "includes/navigation.php"; ?>
<?php
    if(isset($_GET['post_id'])){
        $post_id = $_GET['post_id'];
        $qry = "SELECT * FROM posts WHERE post_id=$post_id";
        $result=mysqli_query($connection,$qry);
        if(!$result)
            die("QUERY FAILED".mysqli_error($connection));
        while($row=mysqli_fetch_assoc($result)){
            $post_title=$row['post_title'];
            $post_author=$row['post_author'];
            $post_date=$row['post_date'];
            $post_content=$row['post_content'];
            $post_image=$row['post_image'];
?>
<!-- Page Content -->
<div class="container">

    <div class="row">

        <!-- Blog Post Content Column -->
        <div class="col-lg-8">

            <!-- Blog Post -->

            <!-- Title -->
            <h2><b><?php echo $post_title; ?></b></h2>

            <!-- Author -->
            <p class="lead">
                by <b><?php echo $post_author; ?></b>
            </p>

            <hr>

            <!-- Date/Time -->
            <p><span class="glyphicon glyphicon-time"></span> Posted on <?php echo $post_date; ?></p>

            <hr>

            <!-- Preview Image -->
            <img class="img-responsive" src="images/<?php echo $post_image; ?>" alt="">

            <hr>

            <!-- Post Content -->
            <p class="lead"><i><?php echo $post_content; ?></i></p>

            <hr>

            <!-- Blog Comments -->
            <?php
    if(isset($_POST['create_comment'])){
        $post_id = $_GET['post_id'];
        $comment_author = $_POST['comment_author'];
        $comment_email = $_POST['comment_email'];
        $comment_content = $_POST['comment_content'];
        
        $qry = "INSERT INTO comments (comment_post_id,comment_author,comment_email,comment_content,comment_status,comment_date) VALUES ($post_id,'$comment_author','$comment_email','$comment_content','unapproved',now())";
        $result = mysqli_query($connection,$qry);
        if(!$result)
                die("Query Failed".mysqli_error($connection));
        
        
        $qry = "UPDATE posts SET post_comment_count = post_comment_count + 1 WHERE post_id=$post_id";
        $result = mysqli_query($connection,$qry);
        if(!$result)
                die("Query Failed".mysqli_error($connection));
    }
?>

            <!-- Comments Form -->
            <div class="well">
                <h4>Leave a Comment:</h4>
                <form action="" method="post" role="form">
                    <div class="form-group">
                        <label for="Author">Author</label>
                        <input type="text" class="form-control" name="comment_author">
                    </div>
                    <div class="form-group">
                        <label for="Author">Email</label>
                        <input type="email" class="form-control" name="comment_email">
                    </div>
                    <div class="form-group">
                        <label for="comment">Your Commentt</label>
                        <textarea class="form-control" name="comment_content" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary" name="create_comment">Submit</button>
                </form>
            </div>

            <hr>

            <!-- Posted Comments -->
            <?php
                    $qry="SELECT * FROM comments WHERE comment_post_id=$post_id and comment_status = 'Approved' ORDER BY comment_id DESC";
                    $result = mysqli_query($connection,$qry);
                    if(!$result)
                        die("QUERY FAILED".mysqli_error($connection));
                    while($row=mysqli_fetch_assoc($result)){
                        $comment_date = $row['comment_date'];
                        $comment_content = $row['comment_content'];
                        $comment_author = $row['comment_author'];
                   ?>
            <!-- Comment -->
            <div class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" src="http://placehold.it/64x64" alt="">
                </a>
                <div class="media-body">
                    <h4 class="media-heading"><?php echo $comment_author; ?>
                        <small><?php echo $comment_date; ?></small>
                    </h4>
                    <?php echo $comment_content; ?>
                </div>
            </div>
            <?php
                }
            ?>
        </div>

        <!-- Blog Sidebar Widgets Column -->
        <?php include "includes/sidebar.php"; ?>

    </div>
    <!-- /.row -->

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; Your Website 2021.</p>
                <h5><b>Made By Kunal Pardeshi(KP).</b></h5>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </footer>
</div>
<?php
        }
    }
?>
<!-- /.container -->

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

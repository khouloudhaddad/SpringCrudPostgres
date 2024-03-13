<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create Anime</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h1 class="p-3">New Anime</h1>
            </div>
            <div class="col-md-12 p-5 mt-5 mx-auto">
                <form:form action="/saveAnime" method="POST" modelAttribute="anime">
                        <div class="form-group row mb-5">
                            <label class="col-md-3" for="name">Name</label>
                            <div class="col-md-9">
                                <form:input type="text" path="name" id="name" class="form-control input-sm" 
                                required="required" />
                            </div>
                        </div>
                        <div class="form-group row mb-5">
                            <label class="col-md-3" for="name">Year</label>
                            <div class="col-md-9">
                                <form:input type="number" path="creation_year" id="creation_year" class="form-control input-sm" required="required" />
                            </div>
                        </div>
                    <div class="row">
                        <div class="col-md-12">
                            <button type="submit"class="btn btn-primary btn-block">Save</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script>
        window.onload = function() {

            var msg = "${message}";
            console.log(msg);
            if (msg == "Save Failure") {
                Command: toastr["error"]("Something went wrong with the save.")
            }

            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
        }
    </script>
</body>

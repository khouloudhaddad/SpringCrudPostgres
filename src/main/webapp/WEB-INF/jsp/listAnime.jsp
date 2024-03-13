<%@page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <meta charset="ISO-8859-1">
    <title>Anime List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
</head>

<body>
    <div class="container my-5">
        <div class="row">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h1 class="p-3">Anime List</h1>
                <a href="/addAnime"  class="btn btn-sm btn-primary">Create Anime</a>
            </div>
            <div class="col-md-12 py-5">
                <form:form>
                       <table class="table table-bordred">
                           <thead>
                           <tr>
                               <th>Id</th>
                               <th>Name</th>
                               <th>Year</th>
                               <th>#</th>
                           </tr>
                           </thead>
                           <tbody>
                           <c:forEach var="anime" items="${animes}">
                               <tr>
                                   <td>${anime.id}</td>
                                   <td>${anime.name}</td>
                                   <td>${anime.creation_year}</td>
                                   <td>
                                       <div class="d-flex align-items-center">
                                           <a href="/editAnime/${anime.id}" class="btn btn-sm btn-success mr-2">Edit</a>
                                           <a href="/deleteAnime/${anime.id}" class="btn btn-sm btn-danger">Delete</a>
                                       </div>
                                   </td>
                               </tr>
                           </c:forEach>
                           </tbody>
                       </table>
                   </form:form>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script>
        window.onload = function (){
            var msg = "${message}"
            console.log(msg)
            if(msg == "Save Success") {
                Command: toastr["success"]("Anime created successfully !")
            }else if(msg == "Update Success"){
                Command: toastr["success"]("Anime updated successfully !")
            }else if(msg == "Delete Success"){
                Command: toastr["success"]("Anime deleted successfully !")
            }else if(msg == "Delete Failure"){
                Command: toastr["error"]("Unable to delete Anime!")
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

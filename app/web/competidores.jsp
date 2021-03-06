<%-- 
    Document   : competidores
    Created on : 17/04/2016, 14:01:42
    Author     : Joyce
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Competidores</title>
        <link href="static/css/bootstrap.css" rel="stylesheet" />
        <link href="static/css/custom-search.css" rel="stylesheet" />
        <script src="static/js/jquery.min.js">
        </script>
        <script src="static/js/jquery.searchable-1.1.0.min.js">
        </script>
        <script src="static/js/custom-searchable.js">
        </script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Banco de Dados III</a>
                        </div>

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="competidores.html">Competidores <span class="sr-only">(current)</span></a></li>
                                <li><a href="provas.html">Provas</a></li>
                                <li><a href="series.html">Séries</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <h1>Competidor: XPTO</h1>
                <p>//Mostra todas os competidores cadastrados e permite cadastrar novo competidor</p>
            </div>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <form action="" class="search-form">
                        <div class="form-group has-feedback">
                            <label for="search" class="sr-only">Search</label>
                            <input type="text" class="form-control" name="search" id="search" placeholder="competidor">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="panel">
                        <div class="panel-body">
                            <table class="table table-hover" id="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Username</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Kilgore</td>
                                        <td>Trout</td>
                                        <td>kilgore</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Bob</td>
                                        <td>Loblaw</td>
                                        <td>boblahblah</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Holden</td>
                                        <td>Caulfield</td>
                                        <td>penceyreject</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <form class="form-horizontal" action="InsereCompetidor" method="POST">
                    <fieldset>

                        <!-- Form Name -->
                        <legend>Novo Competidor</legend>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nome">Nome</label>  
                            <div class="col-md-4">
                                <input id="nome" name="nome" placeholder="" class="form-control input-md" required="" type="text">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nascimento">Nascimento</label>  
                            <div class="col-md-4">
                                <input id="nascimento" name="nascimento" placeholder="" class="form-control input-md" required="" type="date">

                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="patrocinador">Patrocinador</label>
                            <div class="col-md-4">
                                <select id="patrocinador" name="patrocinador" class="form-control">
                                    <option value="1">Option one</option>
                                    <option value="2">Option two</option>
                                </select>
                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="patrocinador">Prova</label>
                            <div class="col-md-4">
                                <select id="patrocinador" name="patrocinador" class="form-control">
                                    <option value="1">Option one</option>
                                    <option value="2">Option two</option>
                                </select>
                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="patrocinador">Série</label>
                            <div class="col-md-4">
                                <select id="patrocinador" name="patrocinador" class="form-control">
                                    <option value="1">Option one</option>
                                    <option value="2">Option two</option>
                                </select>
                            </div>
                        </div>

                        <!-- Button -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="singlebutton"></label>
                            <div class="col-md-4">
                                <button id="singlebutton" name="singlebutton" class="btn btn-success">Salvar</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>

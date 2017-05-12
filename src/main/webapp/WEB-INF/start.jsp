<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>AngularJS BasicAuthenication Example</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/app.css"/>"/>
    <link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon"/>
</head>
<body ng-app="myApp">
<div class="generic-container" ng-controller="UserController as ctrl">
    <a href="<c:url value="/logout"/>">Logout</a>
    <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">User Registration Form </span></div>
        <div class="formcontainer">
            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                <input type="hidden" ng-model="ctrl.user.id"/>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="uname">Name</label>

                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.user.name" id="uname"
                                   class="username form-control input-sm" placeholder="Enter your name" required
                                   ng-minlength="3"/>

                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="age">Age</label>

                        <div class="col-md-7">
                            <input type="number" ng-model="ctrl.user.age" id="age" class="form-control input-sm"
                                   placeholder="Enter your Age"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="salary">Salary</label>

                        <div class="col-md-7">
                            <input type="number" ng-model="ctrl.user.salary" id="salary" class="form-control input-sm"
                                   placeholder="Enter your Salary" ng-pattern="/^[0-9]+(\.[0-9]{1,2})?$/" step="0.01"
                                   required/>

                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.salary.$error.required">This is a required field</span>
                                <span ng-show="myForm.salary.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-actions floatRight">
                        <input type="submit" value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm"
                               ng-disabled="myForm.$invalid">
                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm"
                                ng-disabled="myForm.$pristine">Reset Form
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of Users </span></div>
        <div class="tablecontainer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID.</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Salary</th>
                    <th width="100">
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="u in ctrl.users">
                    <td><span ng-bind="u.id"></span></td>
                    <td><span ng-bind="u.name"></span></td>
                    <td><span ng-bind="u.age"></span></td>
                    <td><span ng-bind="u.salary"></span></td>
                    <td>
                        <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit
                        </button>
                        <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove
                        </button>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="<c:url value="/resources/js/app.js"/>"></script>
<script src="<c:url value="/resources/js/authInterceptor.js"/>"></script>
<script src="<c:url value="/resources/js/user_service.js"/>"></script>
<script src="<c:url value="/resources/js/user_controller.js"/>"></script>
</body>
</html>
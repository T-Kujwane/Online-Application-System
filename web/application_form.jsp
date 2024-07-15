<%-- 
    Document   : application_form
    Created on : 13 Jul 2024, 19:46:07
    Author     : Thato Keith Kujwane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apply</title>
        <link rel="stylesheet" href="primary_styles.css" type="text/css"/>
        <link rel="icon" href="BMA Approved Logo.ico" type="image/x-icon"/>
    </head>
    <body>
        <h1><%=getServletContext().getInitParameter("application_name")%></h1>
        <nav>
            <ul class="nav_list">
                <li class="nav_item"><a class="nav_link" id="home" href="home">Home</a></li>
                <li class="nav_item"><a class="nav_link" id="apply" href="apply">Apply</a></li>
                <li class="nav_item"><a class="nav_link" id="track_application" href="track_application">Track Application</a></li>
                <li class="nav_item"><a class="nav_link" id="about_us" href="about_us">About Us</a></li>
                <li class="nav_item"><a class="nav_link" id="register" href="register">Register</a></li>
                <li class="nav_item"><a class="nav_link" id="login" href="login">Login</a></li>
            </ul>
        </nav>
        <h2>Apply</h2>
        
        <p class="first_paragraph">
            Before you begin, please ensure that you have the following documents, scanned and certified.
        </p>
        
        <ul class="checklist list-group">
            <li class="list-group-item">
                <input type="checkbox" required="">
                <label for="id_document_check">ID Document</label>
            </li>
            
            <li class="list-group-item">
                <input type="checkbox" required="">
                <label for="matric_certificate_check">Matric Certificate</label>
            </li>
        </ul>

        
        <form action="application_processor" method="POST" enctype="multipart/form-data">
            <nav class="form_navigations">
                <input type="button" class="form_nav_button" id="personal_details_nav_button" value="Personal Details" onload="document.getElementById("personal_details_nav_button").click();">
                <input type="button" class="form_nav_button" id="contact_details_nav_button" value="Contact Details" >
                <input type="button" class="form_nav_button" id="address_details_nav_button" value="Address Details">
                <input type="button" class="form_nav_button" id="educational_details_nav_button" value="Educational Details">
            </nav>
            
            <table id="personal_details_form" class="form table-responsive">
                <tr>
                    <td class="prompt">First name(s)</td>
                </tr>
                
                <tr class="input">
                    <td><input id="first_name_input" name="first_name" type="text" required=""></td>
                </tr>
                
                <tr>
                    <td class="prompt">Surname</td>
                </tr>
                
                <tr class="input">
                    <td><input type="text" id="surname_input" required="" name="surname"></td>
                </tr>
                
                <tr>
                    <td class="prompt">13 Digit ID Number</td>
                </tr>
                
                <tr class="input">
                    <td><input type="text" id="id_number_input" name="id_number" required="" maxlength="13" minlength="13"></td>
                </tr>
                
                <tr>
                    <td class="prompt" style="display: none;">Certified ID Copy</td>
                </tr>
                
                <tr class="input">
                    <td>
                        <input id="id_copy_input" type="file" accept="application/pdf" name="id_copy" required="">
                        <label for="id_copy_input" class="file_upload_label">Upload ID Copy</label>
                    </td>
                </tr>
                <tr>
                    <td><input type="button" value="Next" onclick="contactDetailsBtn.click()"></td>
                </tr>
            </table>
            
            <table id="contact_details_form" class="form table-responsive">
                <tr>
                    <td class="prompt">Cell Phone</td>
                </tr>
                
                <tr>
                    <td class="input"><input id="phone_number_input" type="text" minlength="10" maxlength="10" name="phoneNumber" required=""></td>
                </tr>
                
                <tr>
                    <td class="prompt">Email</td>
                </tr>
                
                <tr>
                    <td class="input"><input type="email" name="emailAddress" id="email_address_input" required=""></td>
                </tr>
                <tr>
                    <td><input type="button" value="Back" onclick="personalDetailsBtn.click()">
                        <input type="button" value="Next" onclick="addressDetailsBtn.click()">
                    </td>
                </tr>
            </table>
            
            <table id="address_details_form" class="form table-responsive">
                <tr>
                    <td class="prompt">Street</td>
                </tr>
                
                <tr>
                    <td class="input"><input type="text" name="streetAddress" id="street_address_input" required=""></td>
                </tr>
                
                <tr>
                    <td class="prompt">Suburb</td>
                </tr>
                
                <tr>
                    <td class="input"><input type="text" name="suburb"></td>
                </tr>
                
                <tr>
                    <td class="prompt">City</td> 
                </tr>
                
                <tr>
                    <td class="input"><input type="text" name="city" required=""></td>
                </tr>
                
                <tr>
                    <td class="prompt">Province</td>
                </tr>
                
                <tr>
                    <td class="input">
                        <select id="province_select" name="province" required="">
                            <option value="">-</option>
                            <option value="KZN">KwaZulu-Natal</option>
                            <option value="MP">Mpumalanga</option>
                            <option value="GP">Gauteng</option>
                            <option value="FS">Free State</option>
                            <option value="NW">North West</option>
                            <option value="EC">Eastern Cape</option>
                            <option value="WC">Western Cape</option>
                            <option value="NC">Northern Cape</option>
                            <option value="L">Limpopo</option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td class="prompt">Postal Code</td>
                </tr>
                
                <tr>
                    <td class="input"><input type="number" step="1" min="0000" max="9999" maxlength="4" required="" name="areaCode" id="area_code_input"></td>
                </tr>
                
                <tr>
                    <td>
                        <input type="button" value="Back" onclick="contactDetailsBtn.click()">
                        <input type="button" value="Next" onclick="educationalDetailsBtn.click()">
                    </td>
                </tr>
            </table>
            
            <table id="educational_details_form" class="form table-responsive">
                <tr>
                    <td id="educational_details_input_container">
                        <input type="button" class="add_record_button" id="add_education_button" value="Add Education Record" onclick="createEducationBackgroundForm()">
                        
                    </td>
                </tr>
                
                <tr>
                    <td><input type="button" value="Back" onclick="addressDetailsBtn.click()"></td>
                </tr>
                
                <tr>
                    <td><input type="submit" value="Complete Application"></td> 
                </tr>
            </table>
        </form>
        
        <script src="functions.js" type="text/javascript"></script>
        <script>
            window.onload = function(){
                document.getElementById("personal_details_nav_button").click();
            }
        </script>
    </body>
</html>

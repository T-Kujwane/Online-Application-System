const personalDetailsBtn = document.getElementById("personal_details_nav_button");
const contactDetailsBtn = document.getElementById("contact_details_nav_button");
const addressDetailsBtn = document.getElementById("address_details_nav_button");
const educationalDetailsBtn = document.getElementById("educational_details_nav_button");

const personaDetailsForm = document.getElementById("personal_details_form");
const contactDetailsForm = document.getElementById("contact_details_form");
const addressDetailsForm = document.getElementById("address_details_form");
const eductaionDetailsForm = document.getElementById("educational_details_form");

var tablesCounter = 0;

function createEducationBackgroundForm(){
    const formContainer = document.getElementById("educational_details_input_container");
    
    //Create table
    const educationDetailsTable = document.createElement('table');
    
    //Define border
    educationDetailsTable.border = "1";
    
    //Add table header
    const tableHeader = educationDetailsTable.createTHead();
    
    //Create headers row
    const headerRow = tableHeader.insertRow();
    
    const headers = ['Institution', 'Certificate', 'Qualification Major', 'Graduation Date', 'Is complete'];
    
    //For each header
    headers.forEach(headerText => {
        //Create header element th
        const header = document.createElement('th');
        //Alter the th text
        header.innerText = headerText;
        
        //Append the header element to the header row
        headerRow.appendChild(header);
    });
    
    //Add table body
    const tableBody = educationDetailsTable.createTBody();
    
    //Create table row
    const newRow = tableBody.insertRow();
    
    //Create cell at column 0
    const cell1 = newRow.insertCell(0);
    const nameInput = document.createElement('input');
    
    //Alter input element type
    nameInput.type = "text";
    //Alter input element name
    nameInput.name = "institution[]";
    
    //Attach input element to cell
    cell1.appendChild(nameInput);
    
    //Create cell on column 2
    const cell2 = newRow.insertCell(1);
    const ageInput = document.createElement('input');
    ageInput.type = "text";
    ageInput.name = "certification[]";
    cell2.appendChild(ageInput);
    
    //Cell 3 on row 1
    const cell3 = newRow.insertCell(2);
    const emailInput = document.createElement('input');
    emailInput.type = 'text';
    emailInput.name = 'major[]';
    cell3.appendChild(emailInput);
    
    //Row 1 cell 4
    const cell4 = newRow.insertCell(3);
    const paramInput = document.createElement('input');
    paramInput.type = 'date';
    paramInput.name = 'graduationDate[]';
    cell4.appendChild(paramInput);
    
    //Row 1 cell 5
    const cell5 = newRow.insertCell(4);
    const select = document.createElement('select');
    select.name = 'options[]';
    for (let i = 1; i <= 3; i++){
        const option = document.createElement('option');
        option.value = 'value' + i;
        option.text = 'Option '+i;
        select.appendChild(option);
    }
    cell5.appendChild(select);
    
    formContainer.appendChild(educationDetailsTable);
}

function showPersonalDetailsForm(){
    personaDetailsForm.classList.add('active');
    contactDetailsForm.classList.remove('active');
    addressDetailsForm.classList.remove('active');
    eductaionDetailsForm.classList.remove('active');
    //personalDetailsBtn.click();
}

function showContactDetailsForm(){
    personaDetailsForm.classList.remove('active');
    contactDetailsForm.classList.add('active');
    addressDetailsForm.classList.remove('active');
    eductaionDetailsForm.classList.remove('active');
    //contactDetailsBtn.click();
}

function showAddressDetailsForm(){
    personaDetailsForm.classList.remove('active');
    contactDetailsForm.classList.remove('active');
    addressDetailsForm.classList.add('active');
    eductaionDetailsForm.classList.remove('active');
    //addressDetailsBtn.click();
}

function showEducationalDetailsForm(){
    personaDetailsForm.classList.remove('active');
    contactDetailsForm.classList.remove('active');
    addressDetailsForm.classList.remove('active');
    eductaionDetailsForm.classList.add('active');
    //educationalDetailsBtn.click();
}

personalDetailsBtn.addEventListener("click", function () {
    personalDetailsBtn.classList.add("active");
    contactDetailsBtn.classList.remove("active");
    addressDetailsBtn.classList.remove("active");
    educationalDetailsBtn.classList.remove("active");
    
    showPersonalDetailsForm();
});

contactDetailsBtn.addEventListener("click", function () {
    personalDetailsBtn.classList.remove("active");
    contactDetailsBtn.classList.add("active");
    addressDetailsBtn.classList.remove("active");
    educationalDetailsBtn.classList.remove("active");
    
    showContactDetailsForm();
});

addressDetailsBtn.addEventListener("click", function () {
    personalDetailsBtn.classList.remove("active");
    contactDetailsBtn.classList.remove("active");
    addressDetailsBtn.classList.add("active");
    educationalDetailsBtn.classList.remove("active");
    
    showAddressDetailsForm();
});

educationalDetailsBtn.addEventListener("click", function () {
    personalDetailsBtn.classList.remove("active");
    contactDetailsBtn.classList.remove("active");
    addressDetailsBtn.classList.remove("active");
    educationalDetailsBtn.classList.add("active");
    
    showEducationalDetailsForm();
});
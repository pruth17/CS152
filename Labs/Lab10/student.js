var print = console.log;

 

function Student(firstName, lastName, studentID) {

    this.firstName = firstName;

    this.lastName = lastName;

    this.studentID = studentID;

    this.display = function () {

        print(this.firstName + " " + this.lastName + " " + this.studentID);

        

    }

}

 

var studentArray = [];

 

studentArray.push(new Student("Chandler", "Bing", 0));

studentArray.push(new Student("Rachel", "Green", 1));

 

var Ross = new Student("Ross", "Geller", 2);

Ross.graduated = true;

studentArray.push(Ross);

 

var Joey = {

    firstName: "Joey",

    lastName: "Tribianni",

    studentID: 3,

    __proto__: new Student

};

 

studentArray.push(Joey);

 

//PRINT

for (let i = 0; i < studentArray.length; i++)

    studentArray[i].display();
pipeline {
    agent any
    tools {
        maven 'Maven3' 
    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        
        stage("Git Checkout"){
            steps {
                git branch: 'main',url:"https://github.com/kocagozhkn/case-vdfn"
            }
        }
        
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
     
    }
}

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'vamsiG', url: 'https://github.com/Vamsi1807/Shuttle_Court_New.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy to Tomcat') {
            steps {
                deploy adapters: [tomcat8(credentialsId: 'tomcat', path: '', url: 'http://localhost:8080')], contextPath: '/Shuttle_Court_New', war: 'target/Shuttle_Court_New-0.0.1-SNAPSHOT.war'
            }
        }
    }
}
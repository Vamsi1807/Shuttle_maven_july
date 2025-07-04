pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'vamsiG', url: 'https://github.com/Vamsi1807/Shuttle_maven_july'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy to Tomcat') {
            steps {
                deploy adapters: [tomcat8(credentialsId: 'tomcat', path: '', url: 'http://localhost:8080')], contextPath: '/Shuttle_maven_July', war: 'target/ShuttleJuly4.war'
            }
        }
    }
}

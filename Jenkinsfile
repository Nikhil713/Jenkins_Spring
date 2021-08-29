pipeline {
    agent any
    tools { 
        maven 'Maven'
    }
    stages {
        stage ('Checkout SCM') {
            steps {
                git url: 'https://github.com/Nikhil713/Jenkins_Spring.git'
            }
        }

        stage ('Build docker-compose file') {
            steps {
                sh 'mvn -f ./pom.xml clean install package'
                sh 'docker-compose build'
                sh 'docker-compose up -d'
            }
            post{
            	success{
            		deploy adapters: [tomcat9(credentialsId: '58a5d23a-e2b5-407b-857b-5c911bdfb221', path: '', url: 'http://localhost:8085/')], contextPath: 'maven', war: '**/*.war'
            	}
            }
        }
    }
}

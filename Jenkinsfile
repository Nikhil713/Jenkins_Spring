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
                echo 'Building Docker-Compose file.'
                sh 'echo root@123 | sudo -S sudo docker-compose build'
                sh 'echo root@123 | sudo -S sudo docker-compose up'
            }
        }
    }
}

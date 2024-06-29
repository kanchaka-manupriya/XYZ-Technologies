pipeline {
    agent { label 'master' }

    stages {
        stage('Compile') {
            steps {
                build job: 'compile'
            }
        }
        stage('Test') {
            steps {
                build job: 'test'
            }
        }
        stage('Package') {
            steps {
                build job: 'package'
            }
        }
        stage('Ansible Deploy') {
            steps {
                build job: 'ansible-deploy'
            }
        }
    }
}

pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *') // Poll GitHub repository every 5 minutes
    }

    environment {
        GITHUB_REPO = 'https://github.com/your-username/your-repo.git' // Replace with your GitHub repository URL
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: "${env.GITHUB_REPO}" // Checkout the main branch from your GitHub repository
            }
        }

        stage('Compile') {
            steps {
                script {
                    def compileJob = build job: 'compile', propagate: false
                    if (compileJob.result != 'SUCCESS') {
                        currentBuild.result = 'FAILURE'
                        error('Compile job failed')
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    def testJob = build job: 'test', propagate: false
                    if (testJob.result != 'SUCCESS') {
                        currentBuild.result = 'FAILURE'
                        error('Test job failed')
                    }
                }
            }
        }

        stage('Package') {
            steps {
                script {
                    def packageJob = build job: 'package', propagate: false
                    if (packageJob.result != 'SUCCESS') {
                        currentBuild.result = 'FAILURE'
                        error('Package job failed')
                    }
                }
            }
        }
    }
}

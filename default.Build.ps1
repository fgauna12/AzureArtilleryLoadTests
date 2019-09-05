
$ImageName = "fgauna12/gaunastressyou:preview"

task DockerBuild{
    exec { 
        docker build -t $ImageName .
    }
}

task DockerPush {
    exec {
        docker push $ImageName
    }
}

task . DockerBuild, DockerPush
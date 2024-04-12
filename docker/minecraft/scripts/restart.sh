docker exec minecraft_mc_1 rcon-cli /say "server will be online in about 10 minutes after shutdown";
docker stop minecraft_mc_1;
docker start minecraft_mc_1;

docker exec minecraft-vanilla_mc_1 rcon-cli /say "server will be online in about 10 minutes after shutdown";
docker stop minecraft-vanilla_mc_1;
docker start minecraft-vanilla_mc_1;

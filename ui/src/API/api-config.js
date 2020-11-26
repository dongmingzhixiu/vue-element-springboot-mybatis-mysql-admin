const ip = 'localhost';
const port = "8077";
const server="";
// const ip="192.168.0.113";
// const port="8099";
const uploadIp = process.env.NODE_ENV === 'development' ? `http://${ip}:${port}${server}`: `${server}`;
const isSpringBoot = true;
const staticDir = ['static', 'fileUpload'];
const getFilePath = function(path) {
	if (isSpringBoot) {
		for (let i = 0; i < staticDir.length; i++) {
			var dir = staticDir[i];
			if (path.indexOf(uploadIp + "/" + dir) >= 0 || path.indexOf(uploadIp + "\\" + dir) >= 0) {
				return path.replace(uploadIp + "/" + dir, uploadIp).replace(uploadIp + "\\" + dir, uploadIp);
			}
		}
	} else {
		return path;
	}
}
export default {
	httpPath: uploadIp,
	uploadIp: uploadIp,
	redImgDefaultPath: uploadIp + '\\fileUpload\\default\\error-default.png',
	redImgPath: uploadIp + "/",
	getFilePath: getFilePath,
	wsPath: "ws://",
}

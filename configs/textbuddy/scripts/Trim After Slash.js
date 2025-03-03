// Trim after slash

function perLine(lineOfText, lineNumber) {
	const split = lineOfText.split('/')
	if (split.length > 1) {
		return split[0] + '\n';
	} else {
		return split[0];
	}
  }
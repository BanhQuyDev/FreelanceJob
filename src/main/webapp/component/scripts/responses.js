function getBotResponse(input) {

    switch (input) {
        case "support":
            return `Please send form report through email <a style="color: blue;" href="https://mail.google.com/mail/u/0/#inbox?compose=CllgCJfpJtBKQTMFjXXDwnDZKbHLwrkjkbwWxFpddNwvWjXwtHWPLtXzsmKXhqnGMQKdHQWMSPL" target="_blank">fptfreelancejob@gmail.com</a> `;
        case "complain":
            return `Please email me about your problem via mail <a style="color: blue;" href="https://mail.google.com/mail/u/0/#inbox?compose=CllgCJfpJtBKQTMFjXXDwnDZKbHLwrkjkbwWxFpddNwvWjXwtHWPLtXzsmKXhqnGMQKdHQWMSPL" target="_blank">fptfreelancejob@gmail.com</a>`;
        case "account locked issue":
            return "Please check your email to know the reason for the account lock";
        case "payment":
            return "Please contact hotline +8880 44338899 for direct support";
        case "refund money":
            return "Please contact hotline +8880 44338899 for direct support";
        case "":
            return "Please tell me your problem !";
        default:
            return "You wait a little while the support specialist will come.";

    }
}
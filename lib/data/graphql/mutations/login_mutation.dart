const String loginMutation = """
  mutation Login(\$loginInput: LoginUserInput!) {
    login(loginInput: \$loginInput) {
      access_token
      user {
        id
      firstName
      }
    }
  }
""";

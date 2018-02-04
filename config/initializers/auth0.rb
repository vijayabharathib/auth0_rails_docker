Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    '0FnJS2WjJPmE5t1QssW7ueVDRJtaL92K',
    '3GRJvT6NWEjTL4X646aW8tKK23zdsDb6N5yoFw6bkxiXRpoJr5Xmm_yfbyXEi_q-',
    'tugboat.auth0.com',
    callback_path: "/auth/oauth2/callback",
    authorize_params: {
      scope: 'openid email profile',
      audience: 'https://tugboat.auth0.com/userinfo'
    }
  )
end
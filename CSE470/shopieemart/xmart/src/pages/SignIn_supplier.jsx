import { Link } from 'react-router-dom';

export default function SignIn_Supplier() {
  return (
    <div className="p-6 min-h-screen flex items-center justify-center bg-gradient-to-br from-orange-800 via-lavender-600 to-purple-600">
      <div className="w-full max-w-lg bg-white/20 backdrop-blur-lg p-8 rounded-lg shadow-lg">
        <h1 className="text-4xl text-center font-bold text-white mb-8">
          Sign In to Your Account
        </h1>
        <form className="space-y-6">
          {/* Email Field */}
          <div>
            <label
              htmlFor="email"
              className="block text-sm font-medium text-lavender-200 mb-1"
            >
              Email
            </label>
            <input
              type="email"
              placeholder="Enter your email"
              className="w-full border border-gray-300 bg-white/20 text-black p-3 rounded-lg focus:outline-none focus:ring-2 focus:ring-lavender-500 placeholder-gray-600"
              id="email"
            />
          </div>

          {/* Password Field */}
          <div>
            <label
              htmlFor="password"
              className="block text-sm font-medium text-lavender-200 mb-1"
            >
              Password
            </label>
            <input
              type="password"
              placeholder="Enter your password"
              className="w-full border border-gray-300 bg-white/20 text-black p-3 rounded-lg focus:outline-none focus:ring-2 focus:ring-lavender-500 placeholder-gray-600"
              id="password"
            />
          </div>

          {/* Submit Button */}
          <button
            className="w-full bg-orange-600 text-white py-3 rounded-lg text-lg font-semibold uppercase hover:bg-orange-700 transition"
          >
            Sign In
          </button>
        </form>

        {/* Footer */}
        <div className="flex justify-center gap-2 mt-6">
          <p className="text-white text-sm">Don't have an account?</p>
          <Link to="/signup_supplier">
            <span className="text-lavender-200 text-sm font-semibold hover:underline">
              Sign Up
            </span>
          </Link>
        </div>
      </div>
    </div>
  );
}

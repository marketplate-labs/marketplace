import Link from 'next/link'
import { FC } from 'react'

const NavbarLogo: FC = () => {
  return (
    <Link href={'/'}>
      <a className="text-dark reservoir-h6 text-3xl font-extrabold hover:text-[#1F2937] dark:text-white">
        {process.env.NEXT_PUBLIC_MARKETPLACE_NAME}
      </a>
    </Link>
  )
}

export default NavbarLogo

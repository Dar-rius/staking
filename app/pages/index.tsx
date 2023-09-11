import {useAccount} from 'wagmi'
import { useRouter } from 'next/router'
import Header from '@/components/header'

export default function Home(){ 
    const router = useRouter()
    const {isConnected} = useAccount()
    return<>
      <Header/>
      <section>
          <div>
            <button 
              onClick={()=>router.push("wallet/")}
              disabled={true ? !isConnected : false} 
              >
              Prendre Position
            </button>
          </div>
          <div>
            Votre position
          </div>
      </section>
    </>
}
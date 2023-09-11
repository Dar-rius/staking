import {useAccount, useConnect} from "wagmi"
import {InjectedConnector} from "wagmi/connectors/injected"

export default function Header(){
    const {address, isConnected} = useAccount()
    const {connect} = useConnect({
        connector: new InjectedConnector()
    })

    return<>
        <header>
            {isConnected &&
                <section>
                    {address}
                </section>
            }
            {!isConnected && 
                <section>
                    <button onClick={()=>connect()}>Se Connecter</button>
                </section>
            }
        </header>
    </>
   }